\version "2.24.3"
% Scan 197, printed p. 172: Credo A, Gemeinde.
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
        \new Voice = "sung" { \voiceOne d'2 a'4( g'4 \bar "|" a'4 e'4 f'2) \bar "|" e'4( g'4) }
        \new Voice { \voiceTwo d'2 e'2( c'2 a2) c'4( d'4) }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        Wir "glau : : : :" \skip 1 \skip 1 \skip 1 \skip 1 "ben &c." \skip 1
      }
      \new Staff <<
        \clef bass  \cadenzaOn \omit Staff.TimeSignature
        \new Voice { \voiceOne a2 c'4( b4 a4 g4 f2) a4( bes4) }
        \new Voice { \voiceTwo d2 a,4( e4 f4 c4 d2) a,4( g,4) }
      >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
