<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />

        <style>
            form {
                width: 600px;
            }
            label {
                width: 220px;
            }
            .rs {
                margin-left: 100px;
            }
            .buttons {
                padding-left: 280px;
            }

        </style>
    </head>

    <body>
        <form action="fgotpass.jsp" method="post">
            
            <div>
            <label for="v_id_no">Vehicle Identification Number </label>
            <input type="text" id="v_id_no" name="vin" required />
            </div>
            
            <div>
            <label for="v_reg_no">Vehicle Registration Number </label>
            <input type="text" id="v_reg_no" name="vrn" required />
            </div>
            
            <div>
            <label for="mail">Owner's Email-id </label>
            <input type="text" id="mail" name="email" required />
            </div>

            <div class="buttons">
            <button type="button">SUBMIT</button>
            </div>
            
        </form>
    </body>
</html>
