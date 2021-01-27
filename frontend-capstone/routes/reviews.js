const router = require('express').Router();

router.get('/', (res, req) => {
  console.log('Review Route Page');
});

module.exports = router;
