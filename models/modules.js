const { PrismaClient, Prisma } = require('@prisma/client');
const prisma = new PrismaClient(); 
const { query } = require('../database');
const { EMPTY_RESULT_ERROR, SQL_ERROR_CODE, UNIQUE_VIOLATION_ERROR } = require('../errors');

//CREATE MODULE
module.exports.create = function create(code, name, credit) {
  return prisma.module.create({
    data: {
      modCode: code,
      modName: name,
      creditUnit: parseInt(credit)
    },
  })
  .then(function (module) {
    return module;
  })
  .catch(function (error) {
    if (error instanceof Prisma.PrismaClientKnownRequestError) {
      if (error.code === 'P2002') {
        throw new Error(`A module with the code "${code}" already exists.`);
      }
    }
    throw error; 
  });
};

//UPDATE MODULE
module.exports.updateByCode = function updateByCode(code, credit) {
  return prisma.module.update({
    where: {
      modCode: code,
    },
    data: {
      creditUnit: parseInt(credit),
    },
  })
  .then(function (module) {
    return module;
  })
  .catch(function (error) {
    if (error instanceof Prisma.PrismaClientKnownRequestError) {
      if (error.code === 'P2025') {
        throw new Error(`No module found with code "${code}" to update.`);
      }
    }
    throw error;
  });
};

//DELETE MODULE
// module.exports.deleteByCode = function deleteByCode(code) {
//   return prisma.module.delete({
//     where: {
//       modCode: code,
//     },
//   })
//   .then(function (module) {
//     return module;
//   })
//   .catch(function (error) {
//     if (error instanceof Prisma.PrismaClientKnownRequestError) {
//       if (error.code === 'P2025') {
//         throw new Error(`No module found with code "${code}" to delete.`);
//       }
//     }
//     throw error;
//   });
// };

module.exports.deleteByCode = function deleteByCode(code) {
  // First, check for dependent records
  return prisma.preRequisite.count({
    where: { modCode: code },
  })
  .then(dependentCount => {
    if (dependentCount > 0) {
      // Prevent deletion if dependents exist
      throw new Error(
        `Cannot delete module "${code}" because it has dependent prerequisite records.`
      );
    }
    // No dependents, proceed to delete module
    return prisma.module.delete({
      where: { modCode: code },
    });
  })
  .then(module => {
    return module; // return deleted module info
  })
  .catch(error => {
    if (error instanceof Prisma.PrismaClientKnownRequestError) {
      if (error.code === 'P2025') {
        throw new Error(`No module found with code "${code}" to delete.`);
      }
    }
    throw error; // rethrow other errors
  });
};

//RETRIEVE ALL MOD
module.exports.retrieveAll = function retrieveAll() {
  return prisma.module.findMany()
    .then(modules => {
      return modules;  
    })
    .catch(error => {
      throw error; 
    });
};

//RETRIEVE SINGLE MOD
module.exports.retrieveByCode = function retrieveByCode(code) {
  return prisma.module.findUnique({
    where: {
      modCode: code,
    },
  })
  .then(module => {
    if (!module) {
      throw new Error(`No module found with code "${code}".`);
    }
    return module;
  })
  .catch(error => {
    throw error;
  });
};
