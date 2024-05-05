import Router from "express";
import {
    updateLocations
} from "../controllers/post_locations.js";

const locRoutes = Router();

locRoutes.get("/", (req, res) => {
    res.send({ message: "Locations route is working!" });
});

locRoutes.get("/populate", async (req, res) => {
    await updateLocations();
    res.send({ message: "Locations populated!" });
});


export { locRoutes };