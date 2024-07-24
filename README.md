# hackathon_python_flask_api
Hackathon Python Flask API

This project is a simple Flask CRUD API with SQLAlchemy and Flask-Migrate. It provides endpoints for creating, reading, updating, and deleting items.

## Project Structure
hackathon_python_flask_api/
│
├── setup.bat
├── requirements.txt
├── app.py
└── README.md

## Setup and Run

1. **Clone or Download the Repository**:
    ```sh
    git clone https://github.com/PavanKumar-Kinesso/hackathon_python_flask_api.git
    cd hackathon_python_flask_api
    ```

2. **Run the Setup Script and run the Flask application**:
    ```cmd
    setup.bat && flask run
    ```

3. **Access the API**:
    The API will be running on `http://127.0.0.1:5000`. You can use tools like Postman or curl to interact with the API.

## Endpoints

- **Create Item**:
    - **URL**: `/items`
    - **Method**: `POST`
    - **Payload**:
        ```json
        {
            "name": "Item Name",
            "description": "Item Description"
        }
        ```
    - **Response**: `201 Created`
    - `curl -X POST http://127.0.0.1:5000/items -H "Content-Type: application/json" -d '{"name": "Item1", "description": "This is item 1"}'`

- **Get All Items**:
    - **URL**: `/items`
    - **Method**: `GET`
    - **Response**: `200 OK`
    - `curl http://127.0.0.1:5000/items`

- **Get Item by ID**:
    - **URL**: `/items/<id>`
    - **Method**: `GET`
    - **Response**: `200 OK`
    - `curl http://127.0.0.1:5000/items/1`

- **Update Item**:
    - **URL**: `/items/<id>`
    - **Method**: `PUT`
    - **Payload**:
        ```json
        {
            "name": "Updated Name",
            "description": "Updated Description"
        }
        ```
    - **Response**: `200 OK`
    - `curl -X PUT http://127.0.0.1:5000/items/1 -H "Content-Type: application/json" -d '{"name": "Updated Item", "description": "Updated description"}'`

- **Delete Item**:
    - **URL**: `/items/<id>`
    - **Method**: `DELETE`
    - **Response**: `200 OK`
    - `curl -X DELETE http://127.0.0.1:5000/items/1`