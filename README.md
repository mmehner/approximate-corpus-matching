# approximate corpus matching
shell wrapper for agrep to find approximate matches from a given corpus

## Dependencies
agrep, sed

## Usage
1. For optimal performance make sure your text to be matched and the corpus files are encoded in a way that agrep's error tolerance results are comparable, for Sanskrit I recommend [SLP1](https://en.wikipedia.org/wiki/SLP1) transliteration.
2. Make script executable with `chmod +x /PATH/TO/acm.sh`,
3. (optional) reset variables according to your needs:
   - `strlength` : length of segments,
   - `errno` : number of errors allowed (integer between 0 and 9),
   - `beforestr` : sed-style regexp for pattern to be ignored before the string to be matched (references, etc.),
   - `afterstr` : sed-style regexp for pattern to be ignored after the string to be matched (references, etc.),
   - `output` : bash-style pattern for output file,
4. run script by `/PATH/TO/acm.sh FILE "CORPUS-DIR/*"`.