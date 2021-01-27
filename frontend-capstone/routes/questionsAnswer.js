const router = require('express').Router();

router.get('/', (res, req) => {
  console.log('QA Route Page');
});

module.exports = router;
