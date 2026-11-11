\version "2.24.3"
% Scan 185, printed p. 160: Sunday Alleluia, Hommels Liturgie.
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
        \new Voice = "sung" { \voiceOne d''1 b'2 g'2 \bar "|" c''1\fermata b'2 g'2 \bar "|" a'1 g'1 \bar "|." }
        \new Voice { \voiceTwo g'1 d'2 e'2 g'1 g'2 g'2( g'2) fis'2 g'1 }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        "Hal :" "le :" "lu :" "ja!" "Hal :" "le : :" "lu : :" "ja!"
      }
      \new Staff <<
        \clef bass \key g \major \cadenzaOn \omit Staff.TimeSignature
        \new Voice { \voiceOne b1 d'2 e'2 e'1 d'2 b2 d'1 b1 }
        \new Voice { \voiceTwo g1 g2 e2 c1_\fermata g2 g2 d1 g,1 }
      >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
