<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    var currentCount = '';

    $(document).ready(function() {
        function getRowCount() {
            $.ajax({
                url: "get_row_count.php",
                type: "GET",
                success: function(response) {

                    var count = response;





                    if (currentCount === '') {
                        currentCount = count;

                    }
                    if (count !== currentCount) {
                        alert("A flagged plate " + count + " is detected!");
                        currentCount = count;
                    }


                },
                error: function() {
                    console.log("Error: failed to fetch row count from server");
                }
            });
        }

        setInterval(getRowCount, 1000);
    });
</script>