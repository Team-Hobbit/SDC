const router = require('express').Router();

router.get('/', (res, req) => {
  console.log('Product Route Page');
});

module.exports = router;
