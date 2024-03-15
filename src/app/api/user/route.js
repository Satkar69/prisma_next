import { PrismaClient } from '@prisma/client'
import { NextResponse } from 'next/server'
const prisma = new PrismaClient()

export async function GET() {
    try {
        const users = await prisma.user.findMany();
        return NextResponse.json(
            {
                message: "ok",
                status: 200,
                users
            },
        )
    } catch (error) {
        return NextResponse.json(
            {
                message: "error", 
                error,
                status: 500
            }
        )
    }
}
 
export async function POST() {
    try {
        await prisma.user.create({
            data: {
                user_id: 9,
                name: "Rita",
                age: 22,
                email: "rita@gmail.com",
                role: "BASIC"
            }
        });
        return NextResponse.json(
            {
                message: "created",
                status: 200,
            }
        )
    } catch (error) {
        return NextResponse.json(  
            {
                message: "error",
                error,
                status: 500
            }
        )
    }
}
