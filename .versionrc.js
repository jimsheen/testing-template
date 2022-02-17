const updater = {
    readVersion: (contents) =>  contents,
    writeVersion: (_contents, version) => version
};

const tracker = {
    filename: '.templateversion',
    updater
};

module.exports = {
    bumpFiles: [tracker],
    packageFiles: [tracker]
}