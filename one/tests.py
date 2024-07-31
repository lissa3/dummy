from django.urls import reverse


class TestIndex:
    def test_unauth_user(self, client):
        """
        An unauth user gets a valid resp
        """
        resp = client.get(reverse("index"))
        assert resp.status_code == 200
