\version "2.24.3"

% Scan 191, printed p. 166: Gospel tone, Braunsch.-Lüneburg 1542.
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  paper-height = 250\mm
  left-margin = 0\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
#(set-global-staff-size 18)

\score {
  <<
    \new Staff <<
      \new Voice = "gospel" {
        \clef treble
        \key g \major
        \cadenzaOn
        \omit Staff.TimeSignature
        \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)
        g'1 b'1 g'1 g'1 g'1 g'1 g'1 g'1 b'1 g'1 g'1 b'1 a'1 a'1 a'1 a'1 \break
        a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 b'1 \break
        a'1 a'1 g'1 \bar "|" g'1 b'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 \break
        g'1 a'1 a'1 a'1 b'1 a'1 g'1 g'1 \bar "|" a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 \break
        a'1 b'1 a'1 g'1 g'1 \bar "|" a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 g'1 a'1 a'1 \break
        a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 \break
        a'1 a'1 b'1 a'1 a'1 g'1 \bar "|" a'1 a'1 g'1 a'1 \bar "|" a'1 a'1 a'1 b'1 a'1 g'1 \break
        a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 g'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 \break
        a'1 a'1 a'1 a'1 a'1 a'1 a'1 g'1 \bar "|" a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 \break
        a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 g'1 a'1 \bar "|" a'1 a'1 a'1 a'1 a'1 b'1
      }
    >>
    \new Lyrics \lyricsto "gospel" {
      \set ignoreMelismata = ##t
      Die nach -- fol -- gen -- den Wor -- te des hei -- li -- gen E -- van -- ge -- li -- ums
      be -- schreibt uns der hei -- li -- ge Mat -- thä -- us am ein -- und -- zwan -- zig -- sten
      Ka -- pi -- tel. Da sie nun na -- he bei Je -- ru -- sa -- lem ka -- men
      gen Beth -- pha -- ge an den Oel -- berg, sand -- te JE -- sus sei -- ner Jün -- ger zwei -- en
      und sprach zu ih -- nen: Ge -- het hin in den Fle -- cken, der vor euch liegt,
      und bald wer -- det ihr ei -- ne E -- se -- lin fin -- den an -- ge -- bun -- den
      und ein Fül -- len bei ihr. Lö -- set sie auf und füh -- ret sie zu mir.
      Und so euch Je -- mand et -- was wird sa -- gen, so sprecht: Der HErr be -- darf ihr.
      So bald wird er sie euch las -- sen. Das ge -- schah a -- ber al -- les, auf
      daß er -- fül -- let wür -- de, das ge -- sagt ist durch den Pro -- phe -- ten, der
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}
