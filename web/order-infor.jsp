<%@ page import="bean.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản phẩm</title>
    <link rel="stylesheet" href="css/reset.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

    <link rel="stylesheet" href="css/general.css">
    <link rel="stylesheet" href="css/order-infor.css">
</head>

<body>
<%@include file="header.jsp" %>
<% List<Address> addressList = (List<Address>) request.getAttribute("addressList");
    List<Transport> transportList = (List<Transport>) request.getAttribute("transportList");
    int total = 0;
    for (Detail d : cart) {
        total += d.getTotal();
    }
%>
<div class="container content">
    <div class="row">
        <div class="col-7 left">
            <h5 class="title uppercase">Thanh toán</h5>

            <div class="choose-address">
                <h6 class="title uppercase"><i class="fa-solid fa-location-dot"></i>Địa chỉ </h6>

                <div class="list-address">
                    <%--  3. User chọn địa chỉ    --%>
                    <% for (Address a : addressList) {%>
                    <div class="contain-address bd-bottom">
                        <p>
                            <input type="radio" id="test<%=a.getId()%>" name="address" checked
                                   value="" data-id="<%=a.getId()%>">
                            <label for="test<%=a.getId()%>"><span
                                    class="name"><%=a.getName()%></span>
                                <span class="phone-number"><%=a.getPhone()%></span></label>
                        </p>
                        <div class="address">
                            <%=a.formatAddress(a)%>
                        </div>
                    </div>
                    <%}%>

                </div>
                <button type="button" class="btn-add-address button submit">
                    Thêm địa chỉ mới
                </button>

            </div>
            <div class="way-ship">
                <%--  4. User chọn hình thức giao hàng    --%>
                <h6 class="title uppercase"><i class="fa-solid fa-truck-fast"></i>Hình thức giao hàng </h6>
                <%for (Transport t : transportList) {%>
                <div class="contain-way-ship">
                    <p class="bd-bottom">
                        <input type="radio" class="way-class" id="way1<%=t.getId()%>" name="way-ship" value="1" checked>
                        <label for="way1<%=t.getId()%>">
                            <span class="text"><%=t.getName()%></span>
                            <span class="text fee"><%=Format.format(t.getFee())%> VND</span>
                        </label>
                    </p>
                </div>
                <%}%>
            </div>

            <div class="pay">
                <%--  5. User nhập ghi chú   --%>
                <h6 class="title uppercase"><i class="fa-regular fa-credit-card"></i>Ghi Chú</h6>
                <textarea class="input" rows="10" cols="10" id="note"></textarea>
            </div>
            <div class="cancel">
                <button type="button" class="btn-cancel button submit">
                    Hủy
                </button>
            </div>
            <div class="back">
                <button type="button" class="btn-back button submit">
                    Quay lại
                </button>
            </div>
        </div>
        <div class="col-5 bill p-0">
            <div class="contain-bill p-4">
                <h5 class="title-bill uppercase">đơn hàng</h5>
                <div class="top bd-bottom">
                    <div class="mid bd-bottom">
                        <div class="total row">
                            <div class="col-8 name-product text">Tổng đơn hàng</div>
                            <div class="col-4 text text-right"><span id="cart-total"><%=Format.format(total)%></span>
                                VND
                            </div>
                            <div class="col-8 name-product text">Phí vận chuyển</div>
                            <div class="col-4 text text-right"><span class="ship-fee" id="fee"></span></div>
                        </div>

                    </div>

                    <div class="bottom">
                        <div class="row">
                            <div class="col-6 text uppercase">Tổng cộng</div>
                            <div class="col-6 text text-right"><span
                                    class="total-price"></span>
                            </div>
                        </div>
                        <button class="btn-total uppercase submit submit-order">đặt hàng</button>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
        integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
        crossorigin="anonymous"></script>

<script src="js/general.js"></script>
<script>

    $(document).ready(function () {

        var transportFee = 0;

        function loadTransportFee() {
            let defaultRadio = document.querySelector('input[name="way-ship"]:checked + label .fee');
            let feeSpan = document.getElementById('fee');
            feeSpan.innerHTML = defaultRadio.textContent.toLocaleString('vi-VN');
            let radioList = document.querySelectorAll('.way-class');
            radioList.forEach(function (radio) {
                radio.addEventListener('change', function () {
                    let fee = document.querySelector('input[name="way-ship"]:checked + label .fee');
                    feeSpan.innerHTML = fee.textContent.toLocaleString('vi-VN');
                    transportFee = parseInt(fee.textContent);
                });
            });
        }

        function loadTotal() {
            let cartTotal = document.getElementById('cart-total').textContent;
            let totalPrice = parseInt(cartTotal) + transportFee;
            let totalPriceElements = document.getElementsByClassName('total-price');
            for (let i = 0; i < totalPriceElements.length; i++) {
                totalPriceElements[i].textContent = totalPrice.toLocaleString('vi-VN');
            }
        }

        // 6. User chọn Đặt hàng
        $('.submit-order').click(function () {
            // Lấy thông tin đơn hàng từ các trường dữ liệu
            let addressId = getAddressId();
            let deliveryMethodId = getDeliveryMethodId();
            let note = $('#note').val();
            let orderData = {
                addressId: addressId,
                deliveryMethodId: deliveryMethodId,
                note: note
            };
            $.ajax({
                url: 'finishBuy',
                type: 'GET',
                data: orderData,
                success: function (response) {
                    // 8. Hệ thống chuyển User đến trang Thông báo xác nhận đơn hàng
                    window.location.href = 'http://localhost:8080/finishBuy';
                },
                error: function (xhr, status, error) {
                    console.log('Lỗi khi gửi dữ liệu đơn hàng: ' + error);
                }
            });
        });


        loadTransportFee();
        loadTotal();

        function getAddressId() {
            let selectedAddressId = document.querySelector('input[name="address"]:checked').getAttribute('data-id');
            document.querySelectorAll('input[name="address"]').forEach(function (addressInput) {
                addressInput.addEventListener('click', function () {
                    selectedAddressId = this.getAttribute('data-id');
                });
            });
            return selectedAddressId;
        }

        function getDeliveryMethodId() {
            let deliveryMethodId;
            let checkedRadio = $('input[name="way-ship"]:checked');
            if (checkedRadio.length !== 0) {
                deliveryMethodId = checkedRadio.val();
            } else {
                deliveryMethodId = $('.way-class:first').val();
            }
            return deliveryMethodId;
        }

        <%-- 9. User hủy đặt, chọn nút “Hủy” để tiếp tục mua sắm. Hệ thống đưa người dùng về homepage.--%>
        $('.btn-cancel').click(function () {
            window.location.href = 'http://localhost:8080/homepage';
        })
        <%-- 10. User muốn thay đổi số lượng sản phẩm, chọn nút “Quay lại” ở trang thông tin đơn hàng để trở về Giỏ hàng.--%>
        $('.btn-back').click(function () {
            window.location.href = 'http://localhost:8080/cart';
        })
    })
</script>
</body>

</html>