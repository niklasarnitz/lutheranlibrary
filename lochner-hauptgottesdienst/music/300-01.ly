\version "2.24.3"
% Scan 300, printed p. 275: Benedicamus, two congregational settings.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 2\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}


\score {
  <<
    \new PianoStaff <<
      \new Staff <<
        \clef treble \key g \major \cadenzaOn \omit Staff.TimeSignature
        \new Voice = "sung" { \voiceOne b'2 g'2 a'2( b'2 c''2) b'2 a'2( g'2) g'1 \bar "||" \break
          b'2^\markup { Oder: } g'2 c''2 b'2 a'1 g'1 \bar "|." }
        \new Voice { \voiceTwo d'2 e'2 fis'2( g'2 g'2) g'2 fis'2( g'2) d'1
          d'2 e'2 g'2 g'2 g'2( fis'2) d'1 }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        Gott sei "e : : : :" \skip 1 \skip 1 "wig :" lich \skip 1 "Dank."
        Gott sei "e :" "wig :" lich "Dank."
      }
      \new Staff <<
        \clef bass \key g \major \cadenzaOn \omit Staff.TimeSignature
        \new Voice { \voiceOne g2 b2 d'1( e'2) d'2~ d'2 b2 b1
          g2 b2 e'2 d'2 d'1 b1 }
        \new Voice { \voiceTwo g2 e2 d2( g2 c'2) g2 d2( g2) g1
          g2 e2 c2 g2 d1 g,1 }
      >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
