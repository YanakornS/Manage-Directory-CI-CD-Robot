import requests

BASE_URL = "https://68db5b6323ebc87faa32b2f4.mockapi.io/api/v1/users";

def test_create_user():
    response = requests.post(f"{BASE_URL}", json={'name': 'Yanakorn'})
    assert response.status_code == 201
    response_data = response.json()
    assert 'id' in response_data
    assert response_data['id'] == '52'
    assert response_data['name'] == 'Yanakorn'

def test_get_user():
    response = requests.get(f"{BASE_URL}")
    assert response.status_code == 200
    response_data = response.json()

    # หา user ที่ชื่อ "Yanakorn" แทนที่จะ fix index
    user = next((u for u in response_data if u['name'] == 'Yanakorn'), None)
    assert user is not None
    assert user['name'] == 'Yanakorn'

def test_delete_user():
    user_id = 52
    # Delete the created user
    response = requests.delete(f"{BASE_URL}/{user_id}")
    assert response.status_code == 200
    # Try to get the deleted user
    # response = requests.get(f"{BASE_URL}/users/{user_id}")
    # assert response.status_code == 404
    # assert response.json()['error'] == 'User not found'