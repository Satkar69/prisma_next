-- CreateTable
CREATE TABLE "Customer" (
    "Customer_id" SERIAL NOT NULL,
    "Name" VARCHAR(255),
    "Email" VARCHAR(255),
    "Phone" VARCHAR(20),

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("Customer_id")
);

-- CreateTable
CREATE TABLE "Inventory" (
    "Id" SERIAL NOT NULL,
    "Product_id" INTEGER,
    "Supplier_id" INTEGER,
    "Variant_id" INTEGER,
    "Quantity" INTEGER,

    CONSTRAINT "Inventory_pkey" PRIMARY KEY ("Id")
);

-- CreateTable
CREATE TABLE "Membership" (
    "Membership_Id" SERIAL NOT NULL,
    "Customer_id" INTEGER,
    "Points" INTEGER,

    CONSTRAINT "Membership_pkey" PRIMARY KEY ("Membership_Id")
);

-- CreateTable
CREATE TABLE "Model" (
    "User_id" SERIAL NOT NULL,
    "Name" VARCHAR(255),
    "Email" VARCHAR(255),
    "Password" VARCHAR(255),
    "Phone" VARCHAR(20),
    "Role" VARCHAR(10),

    CONSTRAINT "Model_pkey" PRIMARY KEY ("User_id")
);

-- CreateTable
CREATE TABLE "Product" (
    "Product_id" SERIAL NOT NULL,
    "Name" VARCHAR(255),

    CONSTRAINT "Product_pkey" PRIMARY KEY ("Product_id")
);

-- CreateTable
CREATE TABLE "Supplier" (
    "Supplier_Id" SERIAL NOT NULL,
    "Name" VARCHAR(255),

    CONSTRAINT "Supplier_pkey" PRIMARY KEY ("Supplier_Id")
);

-- CreateTable
CREATE TABLE "Transaction" (
    "Transaction_id" SERIAL NOT NULL,
    "Initiated_by" INTEGER,
    "Performed_by" INTEGER,
    "Product_id" INTEGER,
    "Transaction_method" VARCHAR(10),
    "Total_quantity" INTEGER,
    "Transaction_date" DATE,
    "Total_amount" DOUBLE PRECISION,

    CONSTRAINT "Transaction_pkey" PRIMARY KEY ("Transaction_id")
);

-- CreateTable
CREATE TABLE "Variant" (
    "Variant_Id" SERIAL NOT NULL,
    "Name" VARCHAR(255),
    "Product_id" INTEGER,
    "Price" DOUBLE PRECISION,

    CONSTRAINT "Variant_pkey" PRIMARY KEY ("Variant_Id")
);

-- CreateTable
CREATE TABLE "DemoAuthor" (
    "author_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "DemoAuthor_pkey" PRIMARY KEY ("author_id")
);

-- AddForeignKey
ALTER TABLE "Inventory" ADD CONSTRAINT "Inventory_Product_id_fkey" FOREIGN KEY ("Product_id") REFERENCES "Product"("Product_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Inventory" ADD CONSTRAINT "Inventory_Supplier_id_fkey" FOREIGN KEY ("Supplier_id") REFERENCES "Supplier"("Supplier_Id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Inventory" ADD CONSTRAINT "Inventory_Variant_id_fkey" FOREIGN KEY ("Variant_id") REFERENCES "Variant"("Variant_Id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Membership" ADD CONSTRAINT "Membership_Customer_id_fkey" FOREIGN KEY ("Customer_id") REFERENCES "Customer"("Customer_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_Initiated_by_fkey" FOREIGN KEY ("Initiated_by") REFERENCES "Customer"("Customer_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_Performed_by_fkey" FOREIGN KEY ("Performed_by") REFERENCES "Model"("User_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_Product_id_fkey" FOREIGN KEY ("Product_id") REFERENCES "Product"("Product_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Variant" ADD CONSTRAINT "Variant_Product_id_fkey" FOREIGN KEY ("Product_id") REFERENCES "Product"("Product_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
