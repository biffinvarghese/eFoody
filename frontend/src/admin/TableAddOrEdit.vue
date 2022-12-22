<template>
  <div class="admin-container">
    <form
      id="tableManagementForm"
      class="table-management-form"
      @submit.prevent="handleSubmit"
      novalidate
      autocomplete="off"
    >
      <h1 class="mb-5">{{ isEdit ? "Edit" : "Add" }} Hotels</h1>

      <div v-if="errors.length" class="error-box">
        <ul>
          <li v-for="error in errors" :key="error">{{ error }}</li>
        </ul>
      </div>

      <div class="row mt-2">
        <div class="col-4"><span>Table type:</span></div>
        <div class="col-8">
          <v-select
            v-model="hotel.tableType"
            class="style-chooser"
            :clearable="false"
            :options="tableTypes"
          />
        </div>
      </div>

      <div class="row mt-2">
        <div class="col-4"><span>Table name:</span></div>
        <div class="col-8">
          <v-select
            v-model="hotel.tableName"
            :clearable="false"
            :options="tableNames"
          />
        </div>
      </div>

      <div class="row mt-2 form-group">
        <div class="col-4"><span>Count:</span></div>
        <div class="col-8">
          <input type="number" class="form-control" v-model="hotel.count" />
        </div>
      </div>

      <div class="row mt-2 form-group">
        <div class="col-4"><span>Description:</span></div>
        <div class="col-8">
          <input
            type="text"
            class="form-control"
            v-model="hotel.table_description"
          />
        </div>
      </div>

      <div class="row mt-2 form-group">
        <div class="col-4"><span>Image:</span></div>
        <div class="col-8">
          <input
            type="file"
            class="form-control file-input"
            accept="image/*"
            @change="uploadImage"
          />
        </div>
      </div>
      <div class="row mt-2 form-group">
        <div class="col-4"></div>
        <div class="col-8" v-if="isImageUploaded">
          <img
            :src="'http://localhost:8081/' + hotel.table_image"
            alt=""
            style="width: 10vw"
          />
        </div>
      </div>

      <div class="form-group">
        <input type="submit" value="Submit" class="btn" />
      </div>
    </form>
  </div>
</template>
<script>
import axios from "axios";
import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";
export default {
  name: "TableAddOrEdit",
  components: {
    "v-select": vSelect,
  },
  data() {
    return {
      tableTypes: [
        { label: "2 Seating", value: "two_seating" },
        { label: "4 Seating", value: "four_seating" },
        { label: "8 Seating", value: "eight_seating" },
      ],
      tableNames: [
        { label: "Table 1", value: "table_1" },
        { label: "Table 2", value: "table_2" },
        { label: "Table 3", value: "table_3" },
        { label: "Table 4", value: "table_4" },
        { label: "Table 5", value: "table_5" },
      ],
      hotel: {
        tableType: "",
        tableName: "",
        count: "",
        table_description: "",
        table_image: "",
      },
      errors: [],
      uploadPending: false,
    };
  },
  computed: {
    isImageUploaded() {
      return this.hotel && !!this.hotel.table_image && !this.uploadPending;
    },
    isEdit() {
      return this.$route.query && !!this.$route.query.table_id;
    },
  },
  async mounted() {
    const selector = document.getElementsByClassName("vs__search");
    if (selector && selector.length > 0) {
      for (let index = 0; index < selector.length; index++) {
        const element = selector[index];
        element.classList.add("form-control");
      }
    }
    if (this.$route.query && this.$route.query.table_id)
      await this.fetchTableConfigById(this.$route.query.table_id);
  },
  methods: {
    async handleSubmit() {
      this.errors = [];
      console.log("on hotel submit", this.hotel);
      const payload = {
        table_type: this.hotel.tableType.value || "",
        table_name: this.hotel.tableName.value || "",
        count: this.hotel.count,
        table_description: this.hotel.table_description,
        table_image: this.hotel.table_image,
      };
      const method = this.isEdit ? "put" : "post";
      const path = this.isEdit
        ? "book-tables/" + this.$route.query.table_id
        : "book-tables";
      try {
        const response = await axios[method](path, payload);
        this.$router.push("/admin/dashboard/table-management");
        console.log("error", response);
      } catch (error) {
        console.log("error", error.data);
      }
    },
    async fetchTableConfigById(id) {
      try {
        const response = await axios.get("book-tables/" + id);
        const res = JSON.parse(JSON.stringify(response.data));
        this.hotel = response.data;
        this.hotel.tableType = this.tableTypes.find(
          (type) => type.value === res.table_type
        );
        this.hotel.tableName = this.tableNames.find(
          (name) => name.value === res.table_name
        );
        console.log("error", response);
      } catch (error) {
        console.log("error", error.data);
      }
    },
    async uploadImage(e) {
      this.uploadPending = true;
      if (e && e.target && e.target.files && e.target.files[0]) {
        console.log("response", e);
        const formData = new FormData();
        formData.append("image", e.target.files[0]);
        const response = await axios.post("/upload", formData);
        this.uploadPending = false;
        console.log(response);
        if (response && response.data && response.data.imageUrl) {
          this.hotel.table_image = response.data.imageUrl;
        }
        console.log("response", response);
      }
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

.table-management-form .form-control {
  margin: 0.7rem 0;
  border-radius: 0.5rem;
  background: #f7f7f7;
  padding: 2rem 1.2rem;
  font-size: 1.6rem;
  color: #130f40;
  text-transform: none;
  width: 100%;
  border: none;
}
.vs__search {
  margin: 0.7rem 0;
  border-radius: 0.5rem;
  background: #f7f7f7;
  padding: 2rem 1.2rem;
  font-size: 1.6rem;
  color: #130f40;
  text-transform: none;
  width: 100%;
  border: none;
}

.file-input {
  padding: 2rem 3rem 1rem 3rem !important;
  height: 100%;
}

.vs__dropdown-toggle {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  display: flex;
  padding: 0 0 4px;
  background: lightgray;
  /* border: var(--vs-border-width) var(--vs-border-style) var(--vs-border-color); */
  border-radius: var(--vs-border-radius);
  white-space: normal;
}
</style>
