\version "2.24.3"
% Scan 294, printed p. 269: Dankcollecte, third congregational Amen.
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
        \clef treble  \cadenzaOn \omit Staff.TimeSignature
        \new Voice = "sung" { \voiceOne e'1( fis'1) g'\breve \bar "|." }
        \new Voice { \voiceTwo c'1( d'1) d'\breve }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        "A : :" \skip 1 "men."
      }
      \new Staff <<
        \clef bass  \cadenzaOn \omit Staff.TimeSignature
        \new Voice { \voiceOne g1 a1 b\breve }
        \new Voice { \voiceTwo c1( a,1) g,\breve }
      >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
