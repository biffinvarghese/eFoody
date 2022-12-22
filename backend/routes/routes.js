// import express 
import express from "express";
// import functions from controller part
import {
    showFoods,
    showFoodById,
    createFood,
    updateFood,
    deleteFood,
} from "../controllers/food.js";

import {
    showAUser,
    createAccount,
    allUsers
} from "../controllers/user.js";

import {
    addItems,
    getItem,
    updateItem,
    allItems,
    deleteItem,
    deleteItems
} from "../controllers/cart.js";

import {
   createBook, createBooking,  fetchBookedTables, fetchBookedTablesByTableId, updateBookedTable, deleteBookedTable
} from "../controllers/booktable.js";

import upload from "../config/multer.js";
import { uploadImage } from "../controllers/imageupload.js";

// init of from express router
const router = express.Router();

////////////////////////// FOOD part////////////////////////////////
// get all Food
router.get("/api/foods", showFoods);

// get single Food 
router.get("/api/foods/:id", showFoodById);

// create Food
router.post("/api/foods", createFood);

// update Food 
router.put("/api/foods/:id", updateFood);

// delete Food
router.delete("/api/foods/:id", deleteFood);



////////////////////////// USER part ////////////////////////////////
// get all user
router.get("/api/users/:email", showAUser);

// create account
router.post("/api/users/", createAccount);

// get all user
// router.post("/api/users/")

router.get("/api/users/", allUsers);

// upload an image
router.post('/api/upload', upload.single('image'), uploadImage);

////////////////////////// CART section////////////////////////////////
// add to cart
router.post("/api/cartItem", addItems);

// get a item in cart
router.get("/api/cartItem/:user_id/:food_id", getItem);

// get all items by user id
router.get("/api/cartItem/:id", allItems);

// update item qty
router.put("/api/cartItem/", updateItem);

// delete a item in cart
router.delete("/api/cartItem/:user_id/:food_id", deleteItem);

// delete all items in cart
router.delete("/api/cartItem/:id", deleteItems);



////////////////////////// Booking section ////////////////////////////////
router.post("/api/booking", createBook);
router.post("/api/book-tables", createBooking);
router.get("/api/book-tables", fetchBookedTables);
router.get("/api/book-tables/:table_id", fetchBookedTablesByTableId);
router.put("/api/book-tables/:table_id", updateBookedTable);
router.delete("/api/book-tables/:table_id", deleteBookedTable);

// export default router
export default router;








