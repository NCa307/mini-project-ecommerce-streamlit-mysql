import pandas as pd
import streamlit as st
from functions_streamlit import sign_up, log_in, display_products
from pass_file import password
from sqlalchemy import create_engine, text
connection_string = 'mysql+pymysql://root:Berlin123!@localhost:3306/ecommerce_db'
engine = create_engine(connection_string)
from datetime import date
from decimal import Decimal


st.set_page_config(page_title="E-Commerce App", layout="centered")
st.title("🛒 Welcome to Our E-Commerce Store")



#st.title("E-Commerce Login")
#email = st.text_input("Email")
#password = st.text_input("Password", type="password")
#if st.button("Log In"):
 #   if log_in(engine, email, password):
#        st.success("Login successful")
  #  else:
   #     st.error("Login failed. Check your email and password.")







# Use radio buttons for navigation
st.write("Welcome! Please choose Login or Sign Up from above.")
page = st.radio(
    "Choose an option:",
    ["Login", "Sign Up"])


    
if page == "Login":
    st.subheader("Login to Your Account")
    email = st.text_input("Email")
    password = st.text_input("Password", type="password")
    
    if st.button("Log In"):
        if log_in(engine, email, password):
            st.success("Login successful!")
            products = display_products(engine)
            df = pd.DataFrame(products, columns=["Product ID", "Name", "Category", "Price", "Stock"])
            st.subheader("Available Products")      
            st.dataframe(df)

        else:
            st.error("Login failed. Check your credentials.")

elif page == "Sign Up":
    st.subheader("Create New Account")
    # Add your sign up form here
    st.write("Sign up form would go here")
    first_name = st.text_input("Enter your first name")
    last_name = st.text_input("Enter your last name")
    email = st.text_input("Enter your email")
    password= st.text_input("Enter your password")
    address= st.text_input("Enter your address")
    city= st.text_input("Enter your city")
    phone=st.text_input("Enter your phone")   

    if st.button("Sign Up"):
        from sqlalchemy import create_engine
        sign_up(engine, first_name, last_name, email, password, address, city, phone)
        st.success("Sign up successful")


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
        order_id = result.lastrowid
        choice=st.selectbox("Choose a product:", ["iPhone 15 Pro","Samsung Galaxy S24","MacBook Air M2","iPad Air",
                                                    "Wireless Headphones",
                                                    "Smart Watch",
                                                    "Nike Air Max Shoes",
                                                    "Levi's Jeans",
                                                    "Cotton T-Shirt",
                                                    "Winter Jacket"
                                                    "KitchenAid Mixer",
                                                    "Coffee Maker",
                                                    "Air Fryer",
                                                    "Harry Potter Book Set","Yoga Mat"])
        txt = '''select idproducts, stock, price from ecommerce_db.products 
                  where product_name = :choice;'''
        query = text(txt)
        result = connection.execute(query, {'choice': choice})
        product_id, stock, price = result.fetchone()
        st.write(stock)
        st.write(price)
        st.write(product_id)
        quantity=st.number_input("Order Quantity", min_value=1, max_value=stock, step=1)


        txt = '''insert into order_items (orders_idorders, products_idproducts, quantity, unit_price) 
                      values (:order_id, :products_idproducts, :quantity, :unit_price);'''
        query = text(txt)
        connection.execute(query, {'order_id':order_id, 'products_idproducts': product_id,'quantity': quantity, 'unit_price': price})
        total_price = quantity * price

        txt = '''update ecommerce_db.orders 
                        set total_order_amount = :total_price
                        where idorders = :order_id;'''
        query = text(txt)
        connection.execute(query, {'total_price': total_price, 'order_id': order_id})
        # Update stock
        new_stock = stock - quantity
        txt = '''update ecommerce_db.products 
                 set stock = :new_stock 
                 where idproducts = :product_id;'''
        query = text(txt)
        connection.execute(query, {'new_stock': new_stock, 'product_id': product_id})
        connection.commit()


           
place_order(engine)
if st.button("Place Order"):
    st.success("Order placed successfully!")


                # Update stock
            #new_stock = stock - quantity
            #txt = '''update ecommerce_db.products 
                          #set stock = :new_stock 
                          #where idproducts = :product_id;'''
            #query = text(txt)
            #connection.execute(query, {'new_stock': new_stock, 'product_id': product_id})
                
            #st.success(f"Order placed successfully! Total price: ${total_price:.2f}")




