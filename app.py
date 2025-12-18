import streamlit as st 
import pickle

st.title("Salary Predictor 💵")
st.set_page_config(page_title="Salary Predictor", page_icon="💵")

with open("model.pkl", "rb") as f:
    model = pickle.load(f)

yoe = st.number_input("Enter the Years of Experience", min_value=0.0, max_value=11.0, step=0.5, value=1.0)
if st.button("Predict"):
    predicted_salary = model.predict([[yoe]])
    st.success(predicted_salary)