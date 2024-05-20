from flask import Flask, render_template, request
import pickle
import numpy as np
import warnings
from sklearn.exceptions import InconsistentVersionWarning

warnings.filterwarnings("ignore", category=InconsistentVersionWarning)

app = Flask(__name__)

# Load your pre-trained model
model = pickle.load(open('model.pkl', 'rb'))

@app.route('/')
def hello_world():
    return render_template('index.html', predicted_price=None)

@app.route('/predict', methods=['POST'])
def predict():
    if request.method == 'POST':
        # Get user inputs from the form
        area = int(request.form['area'])
        bedrooms = int(request.form['bedrooms'])
        storey = int(request.form['storey'])
        parking = int(request.form['parking'])

        # Predict the price (uncomment this section once you have your model)
        input_data = np.array([[area, bedrooms, storey, parking]])
        output = round(model.predict(input_data)[0][0],3)
        print(output)

        # Dummy result for testing (comment out when using the actual model)
        # output = 250000  # Replace this line with your model prediction
        # print(f"Predicted Price: {output}")
        
    #     # Render the template with the predicted price
        return render_template('index.html', predicted_price=output)
    # else:
    #     # If it's not a POST request, render with no predicted price
    #     return render_template('index.html', predicted_price=None)

# Correctly set '_main_' here
if __name__ == '__main__':
    app.run(debug=True)
