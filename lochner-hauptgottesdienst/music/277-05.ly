\version "2.24.3"
% Lochner, Brandenburg-Nürnbergische Weise. PDF scan 277, printed p. 252.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 92\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key f \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { <d' f'>1( <e' g'>1 <f' a'>1 <f' bes'>1 <ees' a'>1 <d' g'>1 <d' fis'>1) <d' g'>\breve \bar "||"  }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t A \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 "men." }
    \new Staff { \clef bass \global <d a>1( <c c'>1 <f c'>1 <bes, d'>1 <c c'>1 d1 <d a>1) <g, bes>\breve \bar "||"  }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
