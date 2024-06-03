import { pgTable, timestamp, serial, varchar } from 'drizzle-orm/pg-core'
export const Users = pgTable('Users', {
  id: serial('id').primaryKey(),
  name: varchar('name', { length: 150 }).notNull(),
  email: varchar('email', { length: 256 }).notNull(),
  password: varchar('password', { length: 255 }).notNull(),
  createdAt: timestamp('created_at').defaultNow(),
  updatedAt: timestamp('updated_at').defaultNow(),
})

export const Keys = pgTable('Keys', {})
