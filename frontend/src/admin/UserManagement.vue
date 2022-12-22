<template>
  <div class="admin-container">
    <!-- PROJECT TABLE -->
    <table class="table colored-header datatable project-list">
      <thead>
        <tr>
          <th>Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Birthday</th>
          <th>Gender</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="users in allUser" :key="users.user_id">
          <td>{{ users.user_name }}</td>
          <td>{{ users.user_email }}</td>
          <td>{{ users.user_phone }}</td>
          <td>{{ users.user_birth }}</td>
          <td>{{ users.user_gender }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
  import axios from "axios";
  import { mapState, mapMutations } from "vuex";
  export default {
    name: "Dashboard",
    data() {
      return {
        // avaiableStatus: ["cancel", "confirmed", "preparing", "checking", "delivering", "delivered", "completed"],
        allUser: [],
        // showOrderDetails: false,
        // sendId: undefined,
        // interval: "",
      };
    },
    created() {
      this.getAllUser();
      if (!this.admin) {
        this.$router.push("/");
      }
    },
    mounted: function () {
      // this.autoUpdate();
    },
    // beforeUnmount() {
    //     clearInterval(this.interval)
    // },
    computed: {
      ...mapState(["allUsers", "admin"]),
      // filterBills: function () {
      //     return this.allBills.filter((b) => b.bill_status < 6 && b.bill_status > 0);
      // },
    },
    methods: {
      ...mapMutations(["setAdmin"]),
      async getAllUser() {
        this.allUser = (await axios.get("/users")).data;
        // console.log(this.allUser)
      },
    },
  };
  </script>
  
  <style scoped>
  .admin-container {
    background-color: #fff;
    min-height: calc(100vh - 109px);
    padding: 4em;
    font-size: 16px;
  }
  
  .project-list > tbody > tr > td {
    padding: 12px 8px;
  }
  
  .project-list > tbody > tr > td .avatar {
    width: 22px;
    border: 1px solid #ccc;
  }
  </style>
