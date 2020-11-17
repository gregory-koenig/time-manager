import axios from 'axios';

const API_URL = 'http://0.0.0.0:4000/api/';

class AuthService {
  login(user) {
    return axios
      .post(API_URL + 'sign_in', {
        email: user.email,
        password: user.password
      })
      .then(response => {
        if (response.data.accessToken) {
          localStorage.setItem('user', JSON.stringify(response.data));
        }

        return response.data;
      });
  }

  logout() {
    localStorage.removeItem('user');
  }

  register(user) {
    return axios.post(API_URL + 'sign_up', {
      user:{
      email: user.email,
      password: user.password,
      role_id: 1,
      password_confirmation: user.password_confirmation,
      firstname: user.firstname,
      lastname: user.firstname
    }
    });
  }
}

export default new AuthService();
