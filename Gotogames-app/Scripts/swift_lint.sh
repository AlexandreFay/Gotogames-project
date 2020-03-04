if which "${PODS_ROOT}/SwiftLint/swiftlint" >/dev/null; then
    if [ -f "${PODS_ROOT}/IkoSwiftLint/Configuration.swiftlint.yml" ]; then ${PODS_ROOT}/SwiftLint/swiftlint lint --path Gotogames-app --config ${PODS_ROOT}/IkoSwiftLint/Configuration.swiftlint.yml
    else
        echo "error: ${PODS_ROOT}/IkoSwiftLint/Configuration.swiftlint.yml not found"
        return
    fi
else
    echo "error: SwiftLint not installed, download from https://github.com/ realm/SwiftLint"
    return
fi
