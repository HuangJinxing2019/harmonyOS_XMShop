import { ModelAttributes, ModelOptions } from 'sequelize';

export interface Model_type{
  tableName: string;
  attributes: ModelAttributes,
  options?: ModelOptions
}


