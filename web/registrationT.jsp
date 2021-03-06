<!DOCTYPE html>
<html>
    <head>
        <title>Registration</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />

        <style>
            form {
                width: 600px;
            }
            label {
                width: 220px;
            }
            .buttons {
                padding-left: 220px;
            }
        </style>
    </head>

    <body>
        <form action="" method="post">
            <h4 style="text-align: center">Registration</h4>
            
            <div>
            <label for="v_id_no">Vehicle Identification Number </label>
            <input type="text" id="v_id_no" name="vin" required />
            </div>
            
            <div>
            <label for="v_reg_no">Vehicle Registration Number </label>
            <input type="text" id="v_reg_no" name="vrn" required />
            </div>
            
            <div>
            <label for="ownwer_name">Owner Name </label>
            <input type="text" id="owner_name" name="name" required />
            </div>
            
            <div>
            <label for="owner_address">Owner's Address </label>
            <textarea id="owner_address" name="address"> </textarea>
            </div>
            
            <div>
            <label for="ph_no">Owner's Phone Number </label>
            <input type="text" id="ph_no" name="phoneNo" />
            </div>
            
            <div>
            <label for="mail">Owner's Email-id </label>
            <input type="text" id="mail" name="email" required />
            </div>
            
            <div>
            <label for="user_id">Unique User Id </label>
            <input type="text" id="user_id" name="userId" required />
            <button type="button">Check Availability</button>
            </div>
            
            <div>
            <label for="pwd">Password </label>
            <input type="password" id="pwd" name="password" required />
            </div>
            
            <div>
            <label for="cpwd">Confirm Password </label>
            <input type="password" id="cpwd" name="cpassword" required />
            </div>
            
            <div class="buttons">
            <button type="submit">Submit</button>
            <button type="reset"></te>Reset</button>
            </div>
            
        </form>
    </body>
</html>

<%@ include file="registration.jsp" %>