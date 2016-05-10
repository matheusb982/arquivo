CREATE OR REPLACE FUNCTION update_easel() RETURNS trigger AS $update_easel_trigger$
     DECLARE
       old_easel RECORD;
       new_easel_id INTEGER;
     BEGIN
       IF NEW.easel_name IS NOT NULL THEN

         SELECT INTO old_easel * FROM products
         WHERE products.type = 'Easel'
         AND products.easel_name = NEW.easel_name LIMIT 1;

         IF old_easel.eid IS NOT NULL THEN
           UPDATE products SET easel_id = old_easel.eid WHERE pid = NEW.pid;
         ELSE
           INSERT INTO products(
             eid,
             type,
             easel_name,
             material_id,
             product_type_id,
             quality_id,
             thickness_id,
             treatment_id,
             user_id,
             customer_id
           ) VALUES(
             nextval('products_eid_seq'),
             'Easel',
             NEW.easel_name,
             NEW.material_id,
             NEW.product_type_id,
             NEW.quality_id,
             NEW.thickness_id,
             NEW.treatment_id,
             NEW.user_id,
             NEW.customer_id
           ) RETURNING currval('products_eid_seq') into new_easel_id;

           UPDATE products SET easel_id = new_easel_id WHERE pid = NEW.pid;
         END IF;

       END IF;
       RETURN NULL;
     END;
     $update_easel_trigger$ LANGUAGE plpgsql;

     CREATE TRIGGER update_easel_trigger AFTER INSERT ON products FOR EACH ROW EXECUTE PROCEDURE update_easel();
