
$(document).ready(function () {
    $("#confirm-orders").click(function () {
        // alert("safd");
        var selectAddr =  $('input:radio[name="addressid"]:checked').val();
        if(selectAddr == null) {
            swal("Choose kiosk");
            return;
        }
        var isPay = $('#pay-select').val();
        var oldPrice = $('#total-old').text();
        var newPrice = $('#total-new').text();
        $.ajax({
            url: "/shop/orderFinish",
            type: "POST",
            data: {
                oldPrice: oldPrice,
                newPrice: newPrice,
                isPay: isPay,
                addressid: selectAddr
            },
            success: function () {
                swal("Order Submitted", "", "success");
                location.href = "/shop/info/list"
            },
            error: function () {
                swal("Failed！");
            }
        });
    });
});