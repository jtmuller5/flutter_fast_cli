## Before Generating Your App
Download the prebuilt PocketBase app: https://pocketbase.io/

### Development

To run the PocketBase server during development, open a terminal and navigate to the directory where PocketBase was installed. Run the following command:
```
./pocketbase serve
```

The server should start up at `http://127.0.0.1:8090` (this will be the POCKETBASE_URL you use during development.)

### Production
When you are ready to ship your app to production, visit [pockethost.io](https://pockethost.io/) to set up a new server.


## After Generating Your App

### Config.json
After creating your PocketBase project, add the following variables to your `config.json` file:

```
"POCKETBASE_URL": "",
```
The POCKETBASE_URL for development will be displayed after running `.pocketbase serve`:

```
2024/01/23 11:29:44 Server started at http://127.0.0.1:8090
├─ REST API: http://127.0.0.1:8090/api/
└─ Admin UI: http://127.0.0.1:8090/_/
```

For PocketBase servers hosted on PocketHost, you can find the URL by selecting your app name under the "Dashboard" section of the sidebar:

Dashboard -> {Your Project} -> Overview -> Getting Started

![PocketBase connection instructions](https://github.com/jtmuller5/flutter_fast_cli/raw/main/doc/pocketbase/pocketbase-setup.png)

### Database Updates
The Flutter Fast template requires two database collection: one for users and one for feedback.

PocketBase databases come with a "users" collection which you can edit by clicking the settings icon by the collection name. Add the following fields to the "users" collection:
- first_name (text)
- last_name (text)
- onboarded (boolean)
- date_of_birth (date)
- phone (text)

Next, create the "feedback" collection. Click "New collection" from the sidebar an name the new collection "feedback". Add the following fields:

- message (text)
- user_id (relation to users collection)
- created_at (date)
- type (text)

Finally, select the "API Rules" tab and unlock the "List/Search rule" and the "Create rule". If you do not do this, queries and inserts will fail for clients. 
Eventually, you should set each of these [rules](https://pocketbase.io/docs/api-rules-and-filters/#examples) to the following to prevent unauthorized access:
```
@request.auth.id != ""
```