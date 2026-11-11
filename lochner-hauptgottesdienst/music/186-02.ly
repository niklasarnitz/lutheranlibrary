\version "2.24.3"
% Scan 186, printed p. 161: Easter Alleluia, complete choir continuation.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
soprano = {
  \voiceOne \clef treble \key d \major \time 4/4
  g'2 fis'2 | a'2( b'2 | a'2) g'2 | \break
  fis'2 a'2 | d''4( cis''4 b'2 | a'2 g'4 fis'4 | e'2) d'2 |
  d'2 fis'4( a'4) | a'2 e'2 | \break
  d'2 e'2 | a'2. gis'4 | a'2 d'4 d'4 |
  d'2( e'4 fis'4 | a'2) fis'2 \bar "|."
}
alto = {
  \voiceTwo
  d'2 d'2 | d'1( | cis'2) b4( cis'4) |
  d'4( fis'4) fis'2( | fis'4.)\( e'8 d'4 e'4 |
  fis'2 e'4 d'4( | d'4) cis'4\) d'2 |
  d'2 d'2 | cis'2 cis'2 |
  b2 cis'2 | e'4( fis'2) e'4 | e'2 fis'4 fis'4 |
  s2 cis'4\( d'4( | d'4) cis'4\) d'2
}
tenor = {
  \voiceOne \clef bass \key d \major \time 4/4
  b2 a2 | fis2( g2 | e2) g2 |
  a2. d'4 | a2( b4. cis'8 | d'2 b4 a4 | a2) fis2 |
  fis2 fis2 | e2 a2 |
  fis2 a2 | cis'4( d'8[ cis'8] b4) b4 |
  cis'2 a4 a4 | b2( g4 fis4 | e4 a4) a2
}
bass = {
  \voiceTwo
  g2 d2 | d2( g,2 | a,2) e2 |
  d2 d2 | d4( fis4 g2 | d2 e4 fis8[ g8] |
  \once \omit Stem a2) d2 | d2 d2 | a,2 a,2 |
  b,2 a,2 | a,4( d2) e4 | a,2 d4 d4 |
  g2( e4 d4 | a,2) d2
}
\score {
  \new PianoStaff <<
    \new Staff <<
      \new Voice = "choir" \soprano
      \new Voice \alto
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      "Un :" ser "O : : :" \skip 1 \skip 1 "ster :"
      lamm ist "Chri : : : : : : : : : :"
      \repeat unfold 6 { \skip 1 } "stus," der am \skip 1 Kreuz für
      uns "ge :" "o : : :" pfert "ist." "Hal :" "le :"
      "lu : : : : : : : :" \repeat unfold 3 { \skip 1 } "ja!"
    }
    \new Staff <<
      \new Voice \tenor
      \new Voice \bass
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}
