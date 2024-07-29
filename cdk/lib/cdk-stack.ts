import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import { join } from 'path';
import 'dotenv/config';
import { NodejsFunction } from 'aws-cdk-lib/aws-lambda-nodejs';
import {
  Cors,
  LambdaIntegration,
  LambdaRestApi,
} from 'aws-cdk-lib/aws-apigateway';
import { Code, Runtime } from 'aws-cdk-lib/aws-lambda';

export class CdkStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    const cartServiceLambda = new NodejsFunction(this, 'CartServiceLambda', {
      environment: {
        DB_PORT: process.env.DB_PORT!,
        DB_HOST: process.env.DB_HOST!,
        DB_USER: process.env.DB_USER!,
        DB_PASSWORD: process.env.DB_PASSWORD!,
        DB_NAME: process.env.DB_NAME!,
        REGION: process.env.REGION!,
      },
      functionName: 'cartServiceLambda',
      runtime: Runtime.NODEJS_20_X,
      code: Code.fromAsset(join(__dirname, '../../dist')),
      handler: 'main.handler',
      timeout: cdk.Duration.seconds(30),
      memorySize: 512,
    });

    const cartServiceApi = new LambdaRestApi(this, 'CartService', {
      handler: cartServiceLambda,
      description: 'Cart service api',
      defaultCorsPreflightOptions: {
        allowOrigins: Cors.ALL_ORIGINS,
        allowMethods: Cors.ALL_METHODS,
        allowHeaders: Cors.DEFAULT_HEADERS,
      },
    });

    new cdk.CfnOutput(this, 'CartServiceUrl', {
      value: cartServiceApi.url!,
    });
  }
}
