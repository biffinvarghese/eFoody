<template>
  <div>
    <NavBar :isAdmin="true" />
    <div class="row">
      <!-- Sidebar -->
      <div
        class="w3-sidebar w3-light-grey w3-bar-block column left"
        style="width: 20%"
      >
        <div class="link-container">
          <router-link to="/admin/dashboard/user-management" class="w3-bar-item w3-button"
            >Dashboard</router-link
          >
        </div>
        <div class="link-container">
          <router-link class="w3-bar-item w3-button" to="/admin/dashboard/table-management">Tables</router-link>
        </div>
        <!-- <div class="link-container">
          <a href="#" class="w3-bar-item w3-button">Link 1</a>
        </div> -->
      </div>
      <div class="column right">
        <router-view />
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { mapState, mapMutations } from "vuex";
import NavBar from "@/components/NavBar.vue";
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
    // sendBillId: function (id) {
    //     this.sendId = id
    //     this.showOrderDetails = !this.showOrderDetails;
    // },
    // closeView: function () {
    //     this.showOrderDetails = !this.showOrderDetails;
    // },
    handleLogout: function () {
      this.setAdmin("");
    },
  },
  components: { NavBar },
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

.action-btn,
.cancel-btn,
.paid-btn {
  width: 100px;
  height: 25px;
  color: white;
  text-transform: capitalize;
}

.action-btn {
  background-color: #0da9ef;
  margin-right: 10px;
}

.cancel-btn,
.paid-btn {
  background-color: red;
}

.action-btn:hover {
  background-color: #27ae60;
}

.w3-sidebar {
  height: 100%;
  width: 200px;
  background-color: #eee;
  /* position: fixed !important; */
  z-index: 1;
  overflow: auto;
}
.w3-bar-item {
  width: 100%;
  display: block;
  padding: 8px 16px;
  text-align: left;
  border: none;
  white-space: normal;
  float: none;
  outline: 0;
}

.w3-button {
  border: none;
  display: inline-block;
  padding: 8px 16px;
  vertical-align: middle;
  overflow: hidden;
  text-decoration: none;
  color: inherit;
  background-color: inherit;
  text-align: left;
  cursor: pointer;
  white-space: nowrap;
}
.link-container {
  padding: 1.3em;
  background: lightgray;
  border: #eee;
  border-bottom-style: inset;
  font-size: 1.3em;
  font-weight: 500;
}
.column {
  float: left;
}
.left {
  width: 20%;
  min-height: calc(100vh - 109px);
  position: sticky;
  top: 109px;
}
.right {
  width: 80%;
}
</style>
