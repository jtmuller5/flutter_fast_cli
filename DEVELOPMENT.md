# Basic Steps
1. Open `flutterfast` or `flutterfast_offline` directory
2. Make all desired changes
3. Test locally. For the online flutterfast app, specify the `PAAS` environment variable using --dart-define (one of firebase, supabase, or appwrite)
4. Use flutter_fast_cli to create new app
5. Verify everything looks right

```
dart run ./bin/fast.dart wizard
```

# Variables
- `flutterfast`: Will be replaced by app name

# Deploy
1. Increase version number
2. `flutter pub publish --dry-run`
3. `flutter pub publish`