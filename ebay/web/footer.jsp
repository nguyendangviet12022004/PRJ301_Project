<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/bootstrap-5.0.2-dist/css/bootstrap.min.css"/>
        <style>
            .footer {
                background-color: #f8f8f8;
                padding: 40px 0;
            }
            .footer h4 {
                font-weight: bold;
                margin-bottom: 15px;
            }
            .footer ul {
                list-style: none;
                padding-left: 0;
            }
            .footer ul li {
                margin-bottom: 10px;
            }
            .footer ul li a {
                text-decoration: none;
                color: gray;
                font-weight: 500;
            }
            .footer ul li a:hover {
                text-decoration: underline;
                color: #0066c0;
            }
            .footer-bottom {
                background-color: #f0f0f0;
                padding: 20px 0;
                text-align: center;
                font-size: 14px;
                color: #666;
            }
            .footer-bottom a {
                color: #0066c0;
                text-decoration: none;
            }
            .footer-bottom a:hover {
                text-decoration: underline;
            }
            /* Custom for 5 equal columns */
            .footer .row > div {
                flex: 1;
                max-width: 20%;
            }
            @media (max-width: 768px) {
                .footer .row > div {
                    max-width: 50%;
                    margin-bottom: 20px;
                }
            }
            @media (max-width: 576px) {
                .footer .row > div {
                    max-width: 100%;
                    margin-bottom: 20px;
                }
            }
            .row{
                display: flex;
                justify-content: space-between;
            }
            .container{
                padding: 0px 48px 0px 48px;
            }
        </style>
    </head>
    <body>
        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col">
                        <h4>Buy</h4>
                        <ul>
                            <li><a href="#">Registration</a></li>
                            <li><a href="#">Bidding & buying help</a></li>
                            <li><a href="#">Stores</a></li>
                            <li><a href="#">eBay for Charity</a></li>
                            <li><a href="#">Charity Shop</a></li>
                            <li><a href="#">Seasonal Sales and events</a></li>
                            <li><a href="#">eBay Gift Cards</a></li>
                        </ul>
                    </div>
                    <div class="col">
                        <h4>Sell</h4>
                        <ul>
                            <li><a href="#">Start selling</a></li>
                            <li><a href="#">How to sell</a></li>
                            <li><a href="#">Business sellers</a></li>
                            <li><a href="#">Affiliates</a></li>
                        </ul>
                        <h4>Tools & apps</h4>
                        <ul>
                            <li><a href="#">Developers</a></li>
                            <li><a href="#">Security center</a></li>
                            <li><a href="#">Site map</a></li>
                        </ul>
                    </div>
                    <div class="col">
                        <h4>eBay companies</h4>
                        <ul>
                            <li><a href="#">TCGplayer</a></li>
                        </ul>
                        <h4>Stay connected</h4>
                        <ul>
                            <li><a href="https://www.facebook.com/"><img src="assets/img/facebooklogo.png" alt="facebook logo" style="width: 15px;"> Facebook</a></li>
                            <li><a href="https://x.com/"><img src="assets/img/twitterlogo.png" alt="twitterlogo" style="width: 15px;"> Twitter</a></li>
                        </ul>
                    </div>
                    <div class="col">
                        <h4>About eBay</h4>
                        <ul>
                            <li><a href="#">Company info</a></li>
                            <li><a href="#">News</a></li>
                            <li><a href="#">Deferred Prosecution Agreement</a></li>
                            <li><a href="#">Investors</a></li>
                            <li><a href="#">Careers</a></li>
                            <li><a href="#">Diversity & Inclusion</a></li>
                            <li><a href="#">Global Impact</a></li>
                            <li><a href="#">Government relations</a></li>
                            <li><a href="#">Advertise with us</a></li>
                            <li><a href="#">Policies</a></li>
                            <li><a href="#">VeRO Program</a></li>
                            <li><a href="#">eCI Licenses</a></li>
                        </ul>
                    </div>
                    <div class="col">
                        <h4>Help & Contact</h4>
                        <ul>
                            <li><a href="#">Seller Center</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">eBay Returns</a></li>
                            <li><a href="#">eBay Money Back Guarantee</a></li>
                        </ul>
                        <h4>Community</h4>
                        <ul>
                            <li><a href="#">Announcements</a></li>
                            <li><a href="#">eBay Community</a></li>
                            <li><a href="#">eBay for Business Podcast</a></li>
                        </ul>
                        <h4>eBay Sites</h4>
                        <ul>
                            <li style="color: gray;"><img src="https://upload.wikimedia.org/wikipedia/commons/a/a4/Flag_of_the_United_States.svg" alt="US Flag" style="width: 20px;"> United States</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>Copyright © 1995-2024 eBay Inc. All Rights Reserved. 
                    <a href="#">Accessibility</a>, 
                    <a href="#">User Agreement</a>, 
                    <a href="#">Privacy</a>, 
                    <a href="#">Consumer Health Data</a>, 
                    <a href="#">Payments Terms of Use</a>, 
                    <a href="#">Cookies</a>, 
                    <a href="#">CA Privacy Notice</a>, 
                    <a href="#">Your Privacy Choices</a>, 
                    <a href="#">AdChoice</a>.
                </p>
            </div>
        </footer>
    </body>
</html>
