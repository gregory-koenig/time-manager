export default class User {
    constructor(email, password, password_confirmation, firstname, lastname) {
      this.email = email;
      this.password = password;
      this.password_confirmation = password_confirmation;
      this.firstname = firstname;
      this.lastname = lastname;
    }
  }