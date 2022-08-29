
# Using this app
If you want to clone and use this app, then you have to complete the following steps:

### Step 1: Generate the SHA-1

Use the following command to generate **SHA-1**:

```bash
keytool -list -v \
-alias androiddebugkey -keystore ~/.android/debug.keystore
```

### Step 2: Complete the Firebase setup

First of all, complete the whole Firebase setup for both **Android** and **iOS**. 

> NOTE: USE THE SHA-1 GENERATED FROM YOUR SYSTEM
### Step 4: Run the app

Now, you can run the app on your device using the command:

flutter run

if you have added google account to 2fA using google authenticator it will ask you the token before login success.
if you have already added google account to device then user will simply select the accont and no 2FA will be done.
