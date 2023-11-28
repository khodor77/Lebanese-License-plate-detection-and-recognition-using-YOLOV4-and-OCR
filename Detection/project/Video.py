import cv2
import numpy as np
from paddleocr import PaddleOCR
import time
from methods import *
import datetime


def process_video(video_path):
    results_return = []
    cap = cv2.VideoCapture(video_path)

    # Check if video is opened successfully
    if not cap.isOpened():
        print("Error opening video stream or file.")
        exit()

    # Initialize PaddleOCR
    ocr = PaddleOCR()
    output_file = open('output/output.txt', 'w')

    # Load the YOLOv4 model
    model = cv2.dnn.readNetFromDarknet("C:/Users/Gebruiker/Desktop/project/data/yolov4-obj.cfg",
                                       "C:/Users/Gebruiker/Desktop/project/data/yolov4-obj_best.weights")

    # Set the classes of interest
    classes = ["leb_plate"]

    # Set the confidence threshold
    conf_threshold = 0.5

    # Set the non-maximum suppression threshold
    nms_threshold = 0.4

    # Get the output layer names of the model
    layer_names = model.getLayerNames()
    output_layers = [layer_names[i - 1]
                     for i in model.getUnconnectedOutLayers()]

    # Set up a set to keep track of unique license plate texts
    unique_texts = set()

    # Loop through video frames
    while True:

        t1 = time.process_time()
        ret, img = cap.read()

        if ret:
            # Perform object detection
            blob = cv2.dnn.blobFromImage(
                img, 1/255, (416, 416), swapRB=True, crop=False)
            model.setInput(blob)
            outs = model.forward(output_layers)

        # Get the bounding boxes, confidences and class IDs
            boxes = []
            confidences = []
            class_ids = []
            for out in outs:
                for detection in out:
                    scores = detection[5:]
                    class_id = np.argmax(scores)
                    confidence = scores[class_id]
                    if confidence > conf_threshold and classes[class_id] in classes:
                        center_x = int(detection[0] * img.shape[1])
                        center_y = int(detection[1] * img.shape[0])
                        width = int(detection[2] * img.shape[1])
                        height = int(detection[3] * img.shape[0])
                        left = int(center_x - width / 2)
                        top = int(center_y - height / 2)
                        boxes.append([left, top, width, height])
                        confidences.append(float(confidence))
                        class_ids.append(class_id)

        # Apply non-maximum suppression to remove duplicate detections
            indices = cv2.dnn.NMSBoxes(
                boxes, confidences, conf_threshold, nms_threshold)

        # Crop the license plate region and perform OCR
            if len(indices) > 0:
                for i in indices.flatten():
                    x, y, w, h = boxes[i]
                    license_plate_img = img[y:y+h, x:x+w]
                    results = ocr.ocr(license_plate_img)
                    try:
                        for result in results:
                            text = result[-1][1][0]
                        # Check if this license plate text has already been detected
                            if text not in unique_texts:
                                unique_texts.add(text)
                                cv2.imwrite(f"img/{text}.jpg", img)
                                now = datetime.datetime.utcnow()
                                offset = datetime.timedelta(hours=3)
                                now = now + offset
                                now = now.time()
                                Date = datetime.datetime.now().date()
                                date = "{} {}".format(now, Date)

                                output_file.write(f"{text} , {date}" + '\n')
                                print(text, Date)
                                values = [text, Date]
                                results_return.append(values)
                    except (Exception):
                        print("no results")
            return results_return
        # Display the resulting frame

        # Press Q on keyboard to exit
            if cv2.waitKey(1) & 0xFF == ord("q"):
                break
        else:
            break
    # Release the video capture object and close all windows
        cap.release()
        output_file.close()
        cv2.destroyAllWindows()
        print(t1)


if __name__ == '__main__':
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="masterthesis",
        port=3306
    )

    video_path = "videos/v7.mp4"
    values = process_video(video_path)
    for value in values:
        insert_captured(mydb, value, 'beirut')
        print(value[0])

        add_path(mydb, value[0])
