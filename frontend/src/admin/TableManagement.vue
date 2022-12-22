<template>
  <div class="admin-container">
    <div>
      <button
        class="btn mb-2 float-right"
        @click.prevent="$router.push('/admin/dashboard/table-add-or-edit')"
      >
        Add Table Config
      </button>
    </div>
    <table class="table colored-header datatable project-list">
      <thead>
        <tr>
          <th>Table Type</th>
          <th>Table Name</th>
          <th>Seats</th>
          <th>Description</th>
          <th>Image</th>
          <th>Action</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(tableInfo, index) in tablesData" :key="index">
          <td>{{ tableInfo.table_type }}</td>
          <td>{{ tableInfo.table_name }}</td>
          <td>{{ tableInfo.count }}</td>
          <td>{{ tableInfo.table_description }}</td>
          <td>
            <img
              :src="'http://localhost:8081/' + tableInfo.table_image"
              alt=""
              style="width: 10vw"
            />
          </td>
          <td>
            <button
              class="btn"
              @click.prevent="
                $router.push({
                  path: '/admin/dashboard/table-add-or-edit',
                  query: {
                    table_id: tableInfo.table_id,
                  },
                })
              "
            >
              Edit
            </button>
          </td>
          <td>
            <button
              class="btn"
              @click.prevent="
                deleteTableConfig(tableInfo.table_id)
              "
            >
              Delete
            </button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "TableAddOrEdit",
  data() {
    return {
      tablesData: [],
    };
  },
  mounted() {
    this.fetchBookedTables();
  },
  methods: {
    async fetchBookedTables() {
      try {
        const response = await axios.get("book-tables");
        this.tablesData = response.data;
        console.log("error", response);
      } catch (error) {
        console.log("error", error.data);
      }
    },
    async deleteTableConfig(id) {
      try {
        const response = await axios.delete("book-tables/"+id);
        await this.fetchBookedTables()
        console.log("error", response);
      } catch (error) {
        console.log("error", error.data);
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
