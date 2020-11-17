<template>
  <div class="profile">
    <label class="label">Firstname</label>
    <p class="control">
      <input class="input" type="text" placeholder="John">
    </p>
    <label class="label">Lastname</label>
    <p class="control">
      <input class="input" type="text" placeholder="Doe">
    </p>
    <label class="label">Email</label>
    <p class="control">
      <input class="input" type="text" placeholder="johndoe@example.com">
    </p>
    <label class="label">Role</label>
    <p class="control">
      <input class="input" type="text" placeholder="Employee">
    </p>
    <hr>
    <label class="label">Password</label>
    <p class="control">
      <input class="input" type="password" placeholder="●●●●●●●">
    </p>
    <label class="label">Confirm Password</label>
    <p class="control">
      <input class="input" type="password" placeholder="●●●●●●●">
    </p>
    <hr>
    <p class="control-button">
      <button class="button is-primary">Edit</button>
      <button class="button is-default">Cancel</button>
    </p>
    <!-- <p v-if="currentuser != null">you are {{ currentuser.data.username }}</p>
    <div>
      <h2>Create a user</h2>
      <input v-model="username" placeholder="username" />
      <input v-model="email" placeholder="email" />
      <button v-on:click="createUser()">submit</button>
    </div>
    <hr />
    <div>
      <h2>choose a user</h2>
      <input v-model="username" placeholder="username" />
      <input v-model="email" placeholder="email" />
      <button v-on:click="getUser()">submit</button>
    </div> -->
  </div>
</template>

<script>
/* eslint-disable */
let axios = require("axios");
export default {
  name: "User",
  props: {
    UserName: String,
  },
  // data() {
  //   return {
  //     username: "",
  //     email: "",
  //     currentuser: null,
  //     userID: "4",
  //     users: null,
  //   };
  // },
  // methods: {
  //   createUser: function () {
  //     var url = "http://localhost:4000/api/users";
  //     axios
  //       .post(url, {
  //         user: {
  //           username: this.username, // 参数 firstName
  //           email: this.email, // 参数 lastName
  //         },
  //       })
  //       .then((response) => (this.currentuser = response.data))
  //       .catch(function (error) {
  //         // error
  //         console.log(error);
  //       });
  //   },
  //   updateUser: function () {
  //     var url = "http://localhost:4000/api/users/" + this.userID;
  //     axios
  //       .put(url, {
  //         user: {
  //           username: this.username, // 参数 firstName
  //           email: this.email, // 参数 lastName
  //         },
  //       })
  //       .then((response) => console.log(response));
  //   },
  //   deleteUser: function () {
  //     var url = "http://localhost:4000/api/users/" + this.userID;
  //     axios.delete(url).then((response) => console.log(response));
  //   },
  //   getUser: function () {
  //     var url =
  //       "http://localhost:4000/api/users?email=" +
  //       this.email +
  //       "&username=" +
  //       this.username;
  //     axios.get(url).then((response) =>
  //       //   this.currentuser = response,
  //       this.currentuser = response.data
  //     );
  //   },
  // },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.profile {
  text-align: left;
}

.label {
    margin-bottom: 0.2em;
}

.input {
    margin-bottom: 7px;
}

.hero-body {
    padding: 0px;
    margin-top: -10rem;
}

.label, .input {
  font-size: 11px;
  text-transform: uppercase;
}

#error {
  font-size: 10px;
    text-transform: uppercase;
    margin-top: -22px;
    margin-left: 22px;
    margin-bottom: 15px;
}

.button {
    font-size: 10px;
    text-transform: uppercase;
}

hr {
    background-color: whitesmoke;
    border: none;
    display: block;
    height: 1px;
    margin: 1.5rem 0;
}

.control-button {
  text-align: right;
}

.link {
    font-size: 10px;
    text-transform: uppercase;
    color: #000;
}
</style>
