import shutil
from paddleocr import PaddleOCR
from PIL import Image
import datetime
import numpy as np
import cv2
from methods import *
import time
import math


class masterthesis:

    def __init__(self, filename):
        self.filename = filename
        self.absolutePath = "C:/xampp/htdocs/Detection/project"
        self.img_path = '{}/output/output.jpg'.format(self.absolutePath)

    def classify(self):  # returns the image in an array form

        # Load the image
        img = cv2.imread(
            '{}/input/{}'.format(self.absolutePath, self.filename))
        resized_img = cv2.resize(
            img, (416, 416), interpolation=cv2.INTER_LINEAR)
        model = cv2.dnn.readNetFromDarknet('{}/data/yolov4-obj.cfg'.format(self.absolutePath),
                                           '{}/data/yolov4-obj_best.weights'.format(self.absolutePath))  # Load the YOLOv4 model
        # Set the classes of interest
        classes = ['leb-plate']
        # Define the color for each class
        colors = [(255, 0, 0)]
        # Set the confidence threshold
        conf_threshold = 0.8
        # Set the non-maximum suppression threshold
        nms_threshold = 0.4
        # Get the output layer names of the model
        layer_names = model.getLayerNames()
        output_layers = [layer_names[i - 1]
                         for i in model.getUnconnectedOutLayers()]
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
        if len(indices) > 0:
            for i in indices.flatten():
                x, y, w, h = boxes[i]
                cv2.rectangle(img, (x, y), (x + w, y + h),
                              colors[class_ids[i]], 2)
                cv2.putText(img, classes[class_ids[i]] + ': ' + str(round(confidences[i]*100, 2)) +
                            '%', (x, y - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, colors[class_ids[i]], 2)

        # Save the image
        cv2.imwrite('{}/output/output.jpg'.format(self.absolutePath), img)
        # Show the image
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        # Load an image for text recognition
        return np.array(Image.open(self.img_path))

    def getPlateNumber(self, img):  # takes numpy array
        # Create an instance of the OCR model
        ocr = PaddleOCR()
        # Recognize text in the image
        result = ocr.ocr(img)

        with open('{}/output/output.txt'.format(self.absolutePath), 'a') as file:
            for line in result:
                plate_number = str(line[-1][1][0])

                if plate_number[0] == "0":
                    plate_number = "O" + plate_number[1:]
                elif plate_number[0] == "8":
                    plate_number = "B" + plate_number[1:]
                elif plate_number[0] == "V":
                    plate_number = "N" + plate_number[1:]
                plate_number = plate_number.replace(" ", "")
                now = datetime.datetime.utcnow()
                offset = datetime.timedelta(hours=3)
                now = now + offset
                now = now.strftime("%H:%M:%S")
                Date = datetime.datetime.now().date()
                date = "{} {}".format(now, Date)
                file.write(f'{plate_number} date-time:{date} \n')
                shutil.copy2(f'{self.absolutePath}/output/output.jpg',
                             f'{self.absolutePath}/../img/{plate_number}.jpg')
                return plate_number, date


if __name__ == "__main__":
    t1 = time.process_time()
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="masterthesis",
        port=3306
    )

    filename = "rover.jpg"
    process1 = masterthesis(filename)
    img = process1.classify()
    values = process1.getPlateNumber(img)

    print(values)
    insert_captured(mydb, values, 'beirut')
    add_path(mydb, values[0])
    print(t1)
