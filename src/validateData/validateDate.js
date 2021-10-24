import Joi from 'joi';

const validateSingUp= Joi.object({
    name: Joi.string().min(1).required(),
    email: Joi.string().email({ minDomainSegments: 2, tlds: { allow: ['com', 'net'] } }).required(),
    password: Joi.number().greater(0).required()
});

const validateTransaction= Joi.object({
    description:Joi.string().min(1).required(),
    value: Joi.number().required()
});

export{
    validateSingUp,
    validateTransaction
}