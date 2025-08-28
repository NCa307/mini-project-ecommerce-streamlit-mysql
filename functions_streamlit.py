import streamlit as st
from sqlalchemy.sql import text
from datetime import date
def sign_up(engine, first_name, last_name, email, password, address, city, phone):
    with engine.connect() as connection:
        txt = f'''insert into ecommerce_db.customers (First_name, Last_name, Email, Password, Address, City, Phone)
                  values ("{first_name}", "{last_name}", "{email}", "{password}", "{address}", "{city}", "{phone}" );'''
        query = text(txt)
        connection.execute(query)
        connection.commit()
        return print("sign up successful")

def log_in(engine, email, password):
    with engine.connect() as connection:
        txt = f'''select * from ecommerce_db.customers 
                  where Email = "{email}" and Password = "{password}";'''
        query = text(txt)
        result = connection.execute(query)
        rows = result.fetchall()
        if rows:
            return True
        else:
            return False
        
def display_products(engine):
    with engine.connect() as connection:
        txt = '''select * from ecommerce_db.products;'''
        query = text(txt)
        result = connection.execute(query)
        rows = result.fetchall()
        return rows

def place_order(engine):
    st.subheader("Place an Order")
    with engine.connect() as connection:
        txt = '''select idcustomers from ecommerce_db.customers 
                  where Email = :email;'''
        query = text(txt)
        result = connection.execute(query, {'email': email})
        customer_id = result.fetchone()[0]
        txt = '''insert into orders (customer_id, order_date) 
                  values (:customer_id, :order_date);'''
        query = text(txt)
        result = connection.execute(query, {'customer_id': customer_id, 'order_date': date.today()})
        st.write(customer_id)
        
        
        
        
        
        
        
        
        connection.commit()





    
    

# get customer_id, date (import date from datetime),product, quantity(check if you have enough stock), get order _id, Add it to the orders table,update stock