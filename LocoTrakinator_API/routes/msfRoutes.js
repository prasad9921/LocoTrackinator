
const { Router } = require( 'express' );
const msfController = require('../controllers/msfControllers');
const router = Router();
const mongoose = require('mongoose');

const { requireAuth, checkUser } = require('../middleware/authMiddleware')


router.get('/student', msfController.student);
router.get('/management', msfController.management);
router.get('/teacher',requireAuth, msfController.teacher);
//router.get('/searchbar', msfController.searchField);
router.post('/display', msfController.display);
router.get('/mddata', msfController.mddata);
router.get('/mddata_teacher', msfController.mddata_teacher);
router.post('/teacher_display',requireAuth, msfController.teacher_display);
router.patch('/uplocation', msfController.update_location);

module.exports = router;
