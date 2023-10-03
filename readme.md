## Disable Email Verification for Discourse

### 📌 Introduction

The "Disable Email Verification" plugin is a fork of the old auto_email_verification plugin designed to give Discourse administrators the flexibility to bypass the email verification step during user registration. Once installed and set up, this plugin modifies the `UsersController` and `User` classes to provide the desired functionality.


### 🚀 Features

- Allows bypassing email verification during user registration.
- Ensures the email token is not created if the `disable_email_verification` setting is enabled.
- Automatically sets the `active` field to `true` for a new user if the `disable_email_verification` setting is enabled.

### 📥 Installation

Read the tutorial here: https://meta.discourse.org/t/install-plugins-in-discourse/19157

### ⚙️ Configuration

1. After installation and rebuild, Go to the admin panel of your Discourse instance.
2. Navigate to **Plugins** > Enable **Disable Email Verification** Plugin.
2. Press settings
3. Look for the setting named `disable_email_verification` and enable it to bypass email verification.

Feel free to report any bugs or open a PR. I would appreciate a GitHub star if you like this plugin. Thanks! 😊