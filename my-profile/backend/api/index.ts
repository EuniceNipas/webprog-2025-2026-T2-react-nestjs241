import { NestFactory } from '@nestjs/core';
import { AppModule } from '../src/app.module';
import { ExpressAdapter } from '@nestjs/platform-express';
import type { NestExpressApplication } from '@nestjs/platform-express';
import type { Request, Response } from 'express';

let app: NestExpressApplication | null = null;

async function bootstrap() {
    if (!app) {
        app = await NestFactory.create<NestExpressApplication>(
            AppModule,
            new ExpressAdapter()
        );
        
        app.enableCors({
            origin: [
                'http://localhost:5173',
                'https://webprog-2025-2026-t2-react-nestjs241.vercel.app',
                /\.vercel\.app$/
            ],
            methods: 'GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS',
            credentials: true,
        });
        
        app.setGlobalPrefix('api');
        await app.init();
    }
    return app;
}

export default async (req: Request, res: Response) => {
    const server = await bootstrap();
    return server.getHttpAdapter().getInstance()(req, res);
};

