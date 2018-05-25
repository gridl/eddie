from unittest import mock

import requests


def get_github_user_info(username):
    url = f'https://api.github.com/users/{username}'
    response = requests.get(url)
    print(response.json())
    if response.ok:
        return response.json()
    else:
        return None


# def test_get_github_user_info():
#     username = 'ChillarAnand'
#     info = get_github_user_info(username)
#     assert info is not None
#     assert username == info['login']


def test_get_github_user_info_with_mock():
    with mock.patch('requests.get') as mock_get:
        username = 'ChillarAnand'

        mock_get.return_value.ok = True
        json_response = {"login": username}
        mock_get.return_value.json.return_value = json_response

        info = get_github_user_info(username)

        assert info is not None
        assert username == info['login']
