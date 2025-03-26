// app/javascript/controllers/index.js
import { application } from "../application"
import ParticipantController from "./participant_controller"

application.register("participant", ParticipantController)
