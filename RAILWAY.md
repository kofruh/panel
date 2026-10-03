# Railway checklist for vpnstan

1. GitHub repository root must contain `Dockerfile`.
2. Deploy the repository as a Railway service.
3. Do not upload the ZIP itself as the repository contents.
4. Add a Volume mounted at `/etc/x-ui`.
5. Generate a Railway Domain.
6. Open the domain and use the 3X-UI administrator credentials.
7. Create/configure an Xray inbound inside 3X-UI.
8. In vpnstan, choose that inbound and create a client with name, GB and days.

If Railway still reports `Dockerfile failed validation`, open **View logs** and
copy the first actual error line. The screenshot only shows the summary and does
not contain the parser's specific error.
