import { pgTable, timestamp, serial, varchar, text } from 'drizzle-orm/pg-core'
import { sql } from 'drizzle-orm'
export const Users = pgTable('Users', {
  id: serial('id').primaryKey(),
  phone_number: varchar('phone_number', { length: 10 }).notNull(),
  email: varchar('email', { length: 256 }).notNull(),
  name: varchar('name', { length: 150 }).notNull(),
  password: varchar('password', { length: 255 }).notNull(),
  role: varchar('role', { length: 30 }).notNull(),
  createdAt: timestamp('created_at').defaultNow(),
  updatedAt: timestamp('updated_at').defaultNow(),
})

export const Keys = pgTable('Keys', {
  id: serial('id').primaryKey().notNull(),
  user_id: serial('user_id').references(() => Users.id),
  privateKey: text('privateKey').notNull(),
  publickey: text('publicKey').notNull(),
  createdAt: timestamp('created_at').defaultNow(),
  updatedAt: timestamp('updated_at').defaultNow(),
})
