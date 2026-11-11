\version "2.24.3"
% Scan 198, printed p. 173: Credo B b, Gemeinde.
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
        \clef treble \key ees \major \cadenzaOn \omit Staff.TimeSignature
        \new Voice = "sung" { \voiceOne g'2 \bar "|" g'4 bes'4 aes'4 g'4 \bar "|" f'4 f'4 g'2 }
        \new Voice { \voiceTwo ees'2 ees'4 ees'4 ees'4 ees'4 ees'4 d'4 ees'2 }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        Wir "glau :" ben all. an "ei :" nen "Gott &c."
      }
      \new Staff <<
        \clef bass \key ees \major \cadenzaOn \omit Staff.TimeSignature
        \new Voice { \voiceOne bes2 bes4 bes4 c'4 bes4 aes4 aes4 bes2 }
        \new Voice { \voiceTwo ees2 ees4 g,4 aes,4 ees4 f4 f4 ees2 }
      >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
