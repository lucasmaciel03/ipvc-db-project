import Router from "express";
import {
    storeAreas
} from "../controllers/post_areas.js";

const areasRoutes = Router();

areasRoutes.get("/", (req, res) => {
    res.send({ message: "Areas route is working!" });
});

areasRoutes.get("/populate", async (req, res) => {
    await storeAreas();
    res.send({ message: "Areas populated!" });
});

export { areasRoutes };